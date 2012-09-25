class ClientPagesController < ApplicationController
  def result
    if params!=nil
      @models=Mobile.where("model=?",params[:tags])
    end
  end
  
  def home
    
  end
  
  def autocomplete
    str = params[:term]
    
    @data=Mobile.find_by_sql("SELECT model FROM mobiles WHERE model LIKE '%#{str}%'")
    @data_box=[]
    @data.each do |m|
      @data_box.push(m["model"])
    end
    
    @data_box.uniq! #to eliminate duplicates
    
    respond_to do |format|
    format.html # index.html.erb  
    format.json { render :json => @data_box.to_json }
    end
  end
  
  def data
    @data=Mobile.where("model=?", params[:var])
    
    respond_to do |format|
    format.html # index.html.erb  
    format.json { render :json => @data.to_json }
    end
  end
end
