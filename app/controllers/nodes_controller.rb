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
  def edit
    @node = Node.find(params[:id])
    @nodes = Node.all
  end
  def create
    unless params[:node][:parent] == ""
      @parent = Node.find(params[:node][:parent])
      @node = @parent.children.build(title: params[:node][:title], content: params[:node][:content], parent: @parent)
    else
      params[:node][:parent] = nil
      @node = Node.new(params.require(:node).permit(:parent,:title,:content))
    end

    @node.save
    redirect_to @node
  end

  def update
    @node = Node.find(params[:id])
    unless params[:node][:parent] == "" #if user doesnt want to not have parent
      unless params[:id] == params[:node][:parent] # if the user didnt select a child to be its own parent(error handling)
        @parent = Node.find(params[:node][:parent])
        if @node.update(title: params[:node][:title], content: params[:node][:content], parent: @parent)
          @parent.children << @node # assign new parent
          redirect_to @node
        else
          @nodes = Node.all #makes dropdown work in render
          render 'edit'
        end
      else
        @nodes = Node.all #makes dropdown work in render
        render 'edit'
      end
    else # save node without parent
      if @node.update(title: params[:node][:title], content: params[:node][:content], parent: nil)
        redirect_to @node
      else
        @nodes = Node.all # makes dropdown work in render
        render 'edit'
      end
    end
  end

  private
  def node_params

  end
end
