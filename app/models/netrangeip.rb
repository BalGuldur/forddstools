class Netrangeip 
  def initialize(network)
    @network=network
    @typenetwork="Netrangeip"
  end

  attr_accessor :network
  attr_reader :typenetwork

  def getcheckipas_arr_ip_obj
    rangeip=self.getnetas_arr_of_arr
    ips=Array.new
    rangeip[0].each {|octet1|
      rangeip[1].each {|octet2|
        rangeip[2].each {|octet3|
          rangeip[3].each {|octet4|
            ip=Ip.new
            ip.ipaddress=octet1.to_s+"."+octet2.to_s+"."+octet3.to_s+"."+octet4.to_s
            ip.status=ip.ping
            ips.push(ip)
          }
        }
      }
    }
    return ips
  end
    
  def getnetas_arr_of_arr
    @network=self.network.split(".")
    iprange=@network.collect {|octet|
      if octet.include? "-"
        octet=octet.split("-")
        range=(octet[0].to_i..octet[1].to_i)
        octet=range
      else
        range=Array.new(1,octet.to_i)
        octet=range
      end
    }
    return iprange
  end 
end
