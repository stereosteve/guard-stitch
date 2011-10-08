require 'guard'
require 'guard/guard'
require 'guard/watcher'
require 'stitch-rb'

module Guard
  class Stitch < Guard

    def initialize(watchers = [], options = {})
      super(watchers, options)
      @paths = options.delete(:paths)
      @dependencies = options.delete(:dependencies)
      @output = options.delete(:output)
    end

    def start
      stitch
    end

    def reload
      stitch
    end

    def run_all
      stitch
    end

    def run_on_change(paths)
      stitch
    end

    private
    def stitch
      begin
        js = ::Stitch::Package.new(:paths => @paths, :dependencies => @dependencies).compile
        open(@output, 'w') {|f| f << js}
        UI.info         "Stitched #{@input} to #{@output}"
        Notifier.notify "Stitched #{@input} to #{@output}", :title => 'Stitch'
        true
      rescue Exception => e
        UI.error        "Stitching #{@input} failed: #{e}"
        Notifier.notify "Stitching #{@input} failed: #{e}", :title => 'Stitch', :image => :failed
        false
      end
    end
  end
end
