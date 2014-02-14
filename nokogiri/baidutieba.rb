# encoding: UTF-8

require 'fileutils'
require 'open-uri'
require 'json'
require 'cgi'

# 贴吧检索关键词
keyword=ARGV[0]
escape_kw= CGI::escape(keyword)
# 相册保存路径
path_albums = ARGV[1]

# 相册列表入口
uri_albums = "http://tieba.baidu.com/photo/g?kw=%s&cat_id=all&alt=json&rn=50"
# 相册入口
uri_list = "http://tieba.baidu.com/photo/g/bw/picture/list?kw=%s&alt=json&rn=200&tid=%s&pn=%s&ps=%s&pe=%s&wall_type=h"

albums_json = JSON(open(uri_albums % escape_kw).read)

if albums_json && albums_json["error"] == "failed!"
  puts "Can't find #{keyword}! Please retry!"
  exit(0)
end

unless File.directory?(path_albums)
  puts "Dir not exists, and mkdir #{path_albums}"
  FileUtils.mkdir_p path_albums
end

albums = albums_json["data"]["catalog_detail_list"]["all"]["album_list"]

albums.each do |o|
  id, name, pic_amount = o["id"], o["name"], o["pic_amount"]
  puts "ID:[#{id}]\tNAME:[#{name}]\tAMOUNT:[#{pic_amount}]"

  path = File.join(path_albums, name)
  FileUtils.mkdir(path) unless File.exist?(path)

  threads = []

  # 分页总数
  pn_sum = pic_amount.to_i / 200 + (pic_amount.to_i % 200 > 0 ? 1 : 0)

  got_pids = []
  1.upto(pn_sum) do |pn|
    1.upto(5) do |ps|
      puts uri_list % [escape_kw, id, pn, ps, 40 * ps]
      list = JSON(open(uri_list % [escape_kw, id, pn, ps, 40 * ps]).read)
      list["data"]["pic_list"].each_with_index do |item, i|
        oid = item["img"]["original"]["id"]
        next if got_pids.include?(oid)
        got_pids << oid
        threads << Thread.new do
          begin
            uri_img = item["img"]["original"]["waterurl"]
            uri_img = %{http://imgsrc.baidu.com/forum/pic/item/#{oid}.jpg} if uri_img == ""
            path_img = File.join(path, "#{oid}.jpg")
            if uri_img == ""
              p item
              puts "\r\n" * 3
            else
              cont_img = open(uri_img).read
              File.open(path_img, "wb") {|f| f.puts cont_img}
            end
            puts "Success\tPic: #{i}"
          rescue
            puts "Failed\tPic: #{i}\t\tURI[#{uri_img}]"
          end
        end
        if threads.length == 3
          threads.each {|x| x.join} 
          threads = []
        end
      end
      threads.each {|x| x.join}
    end
  end
end
