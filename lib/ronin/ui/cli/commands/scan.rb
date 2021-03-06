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

require 'ronin/ui/cli/scanner_command'
require 'ronin/scanners/scanner'

module Ronin
  module UI
    module CLI
      module Commands
        class Scan < ScannerCommand

          desc 'Loads and runs a scanner'

          # scanner options
          class_option :name, :type => :string, :aliases => '-n'
          class_option :version, :type => :string, :aliases => '-V'
          class_option :describing, :type => :string, :aliases => '-d'
          class_option :license, :type => :string, :aliases => '-l'
          class_option :params, :type => :hash,
                                :default => {},
                                :banner => 'NAME:VALUE ...',
                                :aliases => '-p'
          class_option :file, :type => :string, :aliases => '-f'

          #
          # Loads and runs the scanner.
          #
          def execute
            Database.setup

            # Load the scanner
            if options[:file]
              load_scanner!
            else
              find_scanner!
            end

            unless @scanner
              print_error "Could not find the specified scanner"
              exit -1
            end

            @scanner.params = options[:params]

            scan!
          end

          protected

          #
          # Loads the scanner from the specified file.
          #
          def load_scanner!
            @scanner = Scanners::Scanner.load_from(options[:file])
          end

          #
          # Finds the cached scanner in the Database.
          #
          def find_scanner!
            @scanner = Scanners::Scanner.load_first do |scanners|
              if options[:name]
                scanners = scanners.named(options[:name])
              end

              if options[:describing]
                scanners = scanners.describing(options[:describing])
              end

              if options[:version]
                scanners = scanners.revision(options[:version])
              end

              if options[:license]
                scanners = scanners.licensed_under(options[:license])
              end

              scanners
            end
          end

        end
      end
    end
  end
end
