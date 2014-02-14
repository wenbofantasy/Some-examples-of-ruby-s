require "erb"  
domains = {}  
sqlTemplate = ERB.new %q{  
<%for organization in domains.keys%>  
insert into org_domain(Domain, organization) values('<%=domains[organization]%>','<%=organization%>');  
<%end%>  
}  
sqlFile = File.new("./sql.sql", "w")  
sqlFile.puts sqlTemplate.result  
