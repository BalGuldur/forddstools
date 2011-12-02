class Network < ActiveRecord::Base
  #network:string typenetwork:string

  def getnotabstractnetwork
    if typenet=self.checktype
      nets=class_eval("#{typenet}.new\"#{self.network}\"")
    else
      return nil
    end
  end

  def checktype
    if self.network =~ /\A*\z/
      return netrangeip=String.new("Netrangeip")
    else
      return nil
    end
  end

  def checktype!
    self.typenetwork=self.checktype
  end

  def getnetas_arr_of_arr 
    #метод возвращающий в виде [integer/range,integer/range,integer/range,integer/range]
    return self.getnotabstractnetwork.getnetas_arr_of_arr
  end

  def getcheckipas_arr_ip_obj
    return self.getnotabstractnetwork.getcheckipas_arr_ip_obj
  end

end
