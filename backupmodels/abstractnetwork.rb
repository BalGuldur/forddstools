class Abstractnetwork
  def initialize(network)
    @network=network
    @typenetwork=String.new
  end

  attr_reader :network, :typenetwork
  attr_writer :network

  def typenetwork=(typenetwork)
    if typenetwork.class!=String
      puts "pls use string"
      return nil
    else
      typenetwork.capitalize
      @typenetwork=typenetwork
    end
  end

  def getnotabstractnetwork
    #медтод должен возвращать объект того типа сети, который указан в стринге нетворк
    #т.е. определять, по возможности тип или возвращать ошибку
    typenet=self.checktype
#    case @typenetwork
#    when "Netrangeip" then return nets=Netrangeip.new(@network)
#    else return nil
#    end
    return nets=class_eval("#{typenet}.new \"#{@network}\"")
  end

  def getnetas_arr_of_arr
    notabstrnet=self.getnotabstractnetwork
    return notabstrnet.getnetas_arr_of_arr
  end

  def getcheckipas_arr_ip_obj
    notabstrnet=self.getnotabstractnetwork
    return notabstrnet.getcheckipas_arr_ip_obj
  end

  def checktype
    if @network =~ /\A*\z/
      return netrangeip=String.new("Netrangeip")
    end
  end

  def checktype!
    @typenetwork=self.checktype
  end
end
