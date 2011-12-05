class NetworksController < ApplicationController
  def index
    @network=Network.new
    @networks=Network.all
  end

  def new
    redirect_to :back #заглушка
  end

  def create
    @network=Network.new(params[:network])
    @network.network.gsub!(",",".") #Заменяет , на . в введенном адресе
    if @network.save
      redirect_to :back
    else
      redirect_to "error"
    end
  end

  def destroy
    # redirect_to :back #заглушка

    @network=Network.find(params[:id])
    @network.delete
    redirect_to :back
  end

  def checkandcreateip
    # redirect_to :back #заглушка
    #
    @network=Network.find(params[:id])
    @network.getcheckipas_arr_ip_obj.each {|ip|
      if ip.status=="online" 
        ip.createcheckip
      end
    }

    redirect_to :back
  end

end
