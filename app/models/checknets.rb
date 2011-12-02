class Checknets

  def allfindandcreate
    @ips=Array.new
    Network.all.each{|network|
      @ips.push(self.findipnetwork(network))
    }
    self.createonlineip
  end

  def findipnetwork(network) 
    #Берет на вход network выдает array of object ip
    ips=Array.new
    ips=network.getcheckipas_arr_ip_obj
    return ips
  end

  # Создает все онлайн ip содержащиейся в массиве @ips экземпляра этого класса
  def createonlineip
    @ips.each {|arrayofip|
      arrayofip.each {|ipaddress|
        if ipaddress.status=="online"
          ipaddress.createcheckip  
        end
      }
    }
  end
end
