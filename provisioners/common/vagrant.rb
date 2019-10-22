class VagrantHelper
  def initialize(orch_path)
    # Instance variables
    @orch_path = orch_path
    end
  def install()
    if @engine_state
      puts 'Engine is already Running'
    else
      @engine_state = true
      puts 'Engine Idle'
    end
  end
end

