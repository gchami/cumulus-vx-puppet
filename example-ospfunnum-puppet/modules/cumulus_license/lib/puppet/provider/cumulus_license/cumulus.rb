Puppet::Type.type(:cumulus_license).provide :cumulus do
  # If cl_license is missing or not configured as an exec
  # Puppet returns error:
  # "Could not find a suitable provider for cumulus_license"
  commands cl_license: '/usr/cumulus/bin/cl-license'

  # If operating system is not cumulus
  # Puppet returns error:
  # "Could not find a suitable provider for cumulus_license"
  # someone asked for a way to log why provider is not suitable
  # but unable to find progress on it. http://bit.ly/17Dhny6
  confine operatingsystem: [:cumuluslinux]

  def exists?
    # if license is forced to be installed, install it.
    return false if resource[:force] == :true
    begin
      cl_license
      return true
    rescue Puppet::ExecutionFailure, RuntimeError => e
      Puppet.debug("License check condition: #{e.inspect}")
      return false
    end
  end

  # install license
  def create
    cl_license(['-i', resource[:src]])
  rescue Puppet::ExecutionFailure => e
    Puppet.debug("Failed to execute cl-license, #{e.inspect}")
  end
end
