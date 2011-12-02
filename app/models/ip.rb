class Ip < ActiveRecord::Base
  Countping=2 #>0
  Intervalping=0.2 #0.2 absolute minimum
  Timeoutping=1 #1 absolute minimum or error ping not end
  Ip_is_unique=true #Use unique ip on table IP or no (perhaps in future be some records IP1+???1, IP1+???2

  if Ip_is_unique==true
    class_eval('validates :ipaddress, :uniqueness => true')
  end

  def createcheckip
    if Ip_is_unique==true
      self.save
    else
    end
  end

  def ping
    @strforping="ping -c #{Countping} -i #{Intervalping} -W #{Timeoutping} -q #{self.ipaddress} | grep received"
    @resping=`#{@strforping}`
    @resping=@resping.split(" ")
    if ('1'..'4').include? @resping[3]
      return "online"
    else
      return "offline"
    end
  end
end
