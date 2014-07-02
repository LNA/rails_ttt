class Players
  attr_accessor :current_player_mark, :current_player_type,
                :current_player, :params,
                :player_one, :player_two

  def initialize(player_one_mark, player_one_type, player_two_mark, player_two_type, player_one, player_two)
    @player_one_mark     = player_one_mark
    @player_one_type     = player_one_type
    @player_two_mark     = player_two_mark
    @player_two_type     = player_two_type
    @current_player_mark = player_one_mark
    @current_player_type = player_one_type
    @player_one          = player_one
    @player_two          = player_two
  end

  def create
    create_player_one
    create_player_two
  end

  def next_player_mark
    @current_player_mark == @player_one.mark ? @player_two.mark : @player_one.mark
  end

  def next_player_type
    @current_player_type == @player_one.type ? @player_two.type : @player_one.type
  end

  # def update
  #   params[:current_player_mark]  = params[:next_player_mark]
  #   params[:current_player_type]  = params[:next_player_type]
  # end

private

  def create_player_one
    @player_one.mark = @player_one_mark
    @player_one.type = @player_one_type
  end

   def create_player_two
    @player_two.mark = @player_two_mark
    @player_two.type = @player_two_type
  end
end