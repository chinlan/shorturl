class LinksController < ApplicationController
  

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
    @link = Link.new
  end



  def show 
    @link = Link.find(params[:id])
  end

  def go
    @link = Link.find(params[:out_url])
    @link.count = @link.count.to_i + 1
    @link.save
    redirect_to @link.in_url
  end

  def create
    @link = Link.new(link_params)

    
      @link.save
        redirect_to links_path
        
    
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:in_url, :out_url)
    end
end
