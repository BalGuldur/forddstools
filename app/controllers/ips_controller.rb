class IpsController < ApplicationController
  def index
    @ips=Ip.all
  end
end
