class NodesController < ApplicationController

  def index
    @rootnodes = Node.where(parent: nil)
  end
  def show
    @node = Node.find(params[:id])
    @nodes = Node.all
  end

  def new
    @node = Node.new
    @nodes = Node.all
  end
  def create
    unless params[:node][:parent].to_i == 0
      @parent = Node.find(params[:node][:parent])
      @node = @parent.children.build(title: params[:node][:title], content: params[:node][:content], parent: @parent)
    else
      params[:node][:parent] = nil
      @node = Node.new(params.require(:node).permit(:parent,:title,:content))
    end


    @node.save
    redirect_to @node
  end

  private
  def node_params
    
  end
end
