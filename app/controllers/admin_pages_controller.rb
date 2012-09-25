class AdminPagesController < ApplicationController
  def dataentry
    if params!=nil
    @user=Mobile.new
    @user.model=params[:model]
    @user.company=params[:company]
    @user.price=params[:price]
    @user.url=params[:url]
    @user.coupon=params[:coupon]
    @user.delivery_time=params[:delivery_time]
    @user.seller_name=params[:seller_name]
    @user.save
    end
  end
  
  def dfill
    require 'open-uri'
    require 'nokogiri'
    @seller_info=[]
    @price_info=[]
    @delivery_time=[]
    @url=[]
    @model_name=[]
    @coupon = 'ABCK99H'
    seller_temp=""
    
    
    @company= params[:company]
    link= params[:link]
    @doc1 = Nokogiri::HTML(open(link))
    @doc1.xpath(".//*[@id='link']").each do |node|
      
    @doc = Nokogiri::HTML(open(node.attr('href')))
    i=1
    
    
    while !@doc.xpath(".//*[@id='#{i}']/table/tr[1]/td[1]/a/img").empty?
      
      seller_temp=@doc.xpath(".//*[@id='#{i}']/table/tr[1]/td[1]/a/img").attr('alt').value
      k=Mobile.where("model=? AND seller_name=?",node.text,seller_temp)
      
      if k.empty?
        m=Mobile.new
      else
        m=k[0]
      end
      
      #price conversion to integer
      p=@doc.xpath(".//*[@id='#{i}']/table/tr[1]/td[2]/b").text
      p=p.scan(/[\d,]+/)
      if p.empty?
        p=0
      else
        p=p[0].sub(',','')
        p=p.to_i
      end
      
      m.price=p
      m.model=node.text
      m.delivery_time=@doc.xpath(".//*[@id='#{i}']/table/tr[1]/td[3]").text
      m.seller_name=seller_temp
      m.coupon=@coupon
      m.company=params[:company]
      
      @model_name.push(node.text)
      @seller_info.push(seller_temp)
      @price_info.push(@doc.xpath(".//*[@id='#{i}']/table/tr[1]/td[2]/b").text)
      @delivery_time.push(@doc.xpath(".//*[@id='#{i}']/table/tr[1]/td[3]").text)
      temp=@doc.xpath(".//*[@id='#{i}']/table/tr[1]/td[5]/a").attr("href").value
      
      if !(seller_temp=='btp'||seller_temp=='costprize')
      temp=temp.split('?')
      temp=temp[1].split('=')
      temp[0]=temp[1]
      end

      if seller_temp=='btp'
      temp=temp.split('=')
      temp[0]=temp[4]
      end
       
       if seller_temp=='costprize'
        temp=temp.split('url=')
        temp[0]=temp[1]
       end
       
      @url.push(temp[0])
      i=i+1
      
      m.url=temp[0]
      m.save
      
    end
    end
  end
    
  def fetch_link
  
  end

  def Seller
    if params!=nil
      
      if Seller.find_by_seller_name(params[:seller_name])!=nil
        s=Seller.find_by_seller_name(params[:seller_name])
      else
        s=Seller.new  
      end
      
      s.seller_name= params[:seller_name]
      s.description= params[:description]
      s.delivery_time= params[:delivery_time]
      s.logo_url= params[:logo_url]
      s.xpath_price= params[:xpath_price]
      s.flag= params[:flag]
      s.base_url= params[:base_url]
      s.save
    end
  end
  
  def cronJob
    
    require 'open-uri'
    require 'nokogiri'
    @s_price_old=[]
    @s_price_new=[]
    @seller=[]
    @error_link=[]
    @error_type=[]
    @change=[]
    
    m=Mobile.all
    #m=Mobile.where("seller_name=?","snapdeal")
    i=0
    while i<m.length
      
      s=Seller.find_by_seller_name(m[i].seller_name)
      if s!=nil
        if s.flag==1
          
          
          begin
            doc_cron=Nokogiri::HTML(open(m[i].url, 'r', :read_timeout=>5))
            
          rescue Exception => e
            @error_link.push(m[i].url)
            @error_type.push(e.to_s)
            next
          end
          
          
          @s_price_old.push(m[i].price)
            p=doc_cron.xpath(s.xpath_price).text
            p=p.scan(/[\d,]+/)
            if p.empty?
              p=0
            else
              p=p[0].sub(',','')
              p=p.to_i
            end
              if m[i].price==p
                @change.push("No")  
              else
                @change.push("Yes")
                #here price changes so we will enter value into update_managers table too.
                um=UpdateManager.new
                um.seller_name=m[i].seller_name
                um.model=m[i].model
                um.company=m[i].company
                um.old_price=m[i].price
                um.new_price=p
                um.url=m[i].url
                um.save
                #here updating real table.
                m[i].price=p
                m[i].save
              end
            
          @s_price_new.push(m[i].price)
          @seller.push(m[i].seller_name)
        end
      end
      
      i=i+1
    end
    
  end

end
