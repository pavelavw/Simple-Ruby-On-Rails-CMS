class SectionsController < ApplicationController


 layout 'admin'
 before_action :find_page

def index
 if @subject
 @sections = @page.sections.sorted

  else
   @sections = Section.all
  end

 end

def show
  
  @section = Section.find(params[:id])
  @comments = Comments.where(section_id:@section)

end


def new

   @section = Section.new({ :name => "Default"})
   @pages = Page.all
   @section_count = Section.count + 1
   
end

def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index')
    else
      @pages = @page.subject.pages.sorted
      @section_count = Section.count + 1
      render('new')
    end
  end


def show

  @section = Section.find(params[:id])

end


def  edit
  
  @section = Section.find(params[:id])
  @pages = Page.all
  @section_count = Section.count + 1


end


def update

  @section = Section.find(params[:id])
  @pages = Page.all

   if @section.update_attributes(section_params)


	   flash[:notice]= "Updated Succesfully"

	   redirect_to ({action: :index})
           @section_count = Section.count + 1

     else
         
         

	   redirect_to 'edit'
    
     end


end


def delete

 @section = Section.find(params[:id])


end

def destroy

   @section = Section.find(params[:id]).destroy

   flash[:notice]= "Deleted Successfully"

   redirect_to ({action: :index})


end



private

  def section_params

    params.require(:section).permit(:page_id,:name,:position,:visible,:image,:content_type,:content)
   end


 def find_page

    if params[:page_id] 
     @page = Page.find(params[:page_id])
    end
   

  end



end
