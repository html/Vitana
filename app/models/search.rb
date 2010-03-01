class Search < ActiveRecord::Base
  def self.find(q)
    where_sql1 = sanitize_conditions(["categories.title like '%%%s%%' or p1.content like '%%%s%%'", q, q])
    where_sql2 = sanitize_conditions(["pages.title like '%%%s%%' or pages.content like '%%%s%%'", q, q])
    connection.execute "
      select categories.title as title, p1.content as content, 'category' as item_type, categories.id as id, (select count(*) from pages as p where p.category_id = categories.id) cc 
        from categories 
        left join pages p1 
          on p1.category_id = categories.id  
        where cc = 1 and #{where_sql1}
      union 
      select pages.title as title, pages.content as content, 'page' as item_type, pages.id as id, (select count(*) from pages p where p.category_id = pages.category_id) as cc from pages where  cc > 1 and #{where_sql2} order by title, content;"
  end
end
