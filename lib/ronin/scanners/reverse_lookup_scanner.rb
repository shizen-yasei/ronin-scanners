#
# Ronin Scanners - A Ruby library for Ronin that provides Ruby interfaces to
# various third-party security scanners.
#
# Copyright (c) 2008-2010 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ronin/scanners/host_name_scanner'

require 'resolv'

module Ronin
  module Scanners
    class ReverseLookupScanner < HostNameScanner

      parameter :ip, :description => 'The IP address to reverse lookup'

      protected

      #
      # Performs a reverse lookup on an IP address.
      #
      # @yield [host]
      #   The host name associated with the IP address.
      #
      # @yieldparam [String] host
      #   A host name associated with the IP address.
      #
      def scan(&block)
        Resolv.getnames(self.host).each(&block)
      end

    end
  end
end