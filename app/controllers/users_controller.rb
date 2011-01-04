class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
  	if !session[:user_id]
		redirect_to :action=> 'login'
	else
		@users = User.all

		respond_to do |format|
		  format.html # index.html.erb
		  format.xml  { render :xml => @users }
		end
	end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    if !session[:user_id]
		redirect_to :action=> 'login'
	else 
		@user = User.find(params[:id])
	
		respond_to do |format|
		  format.html # show.html.erb
		  format.xml  { render :xml => @user }
		end
	end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    if !session[:user_id]
		redirect_to :action=> 'login'
	else
		@user = User.new
	
		respond_to do |format|
		  format.html # new.html.erb
		  format.xml  { render :xml => @user }
		end
	end
  end

  # GET /users/1/edit
  def edit
  	if !session[:user_id]
		redirect_to :action=> 'login'
	else
    	@user = User.find(params[:id])
	end
  end

  # POST /users
  # POST /users.xml
  def create
  	if !session[:user_id]
		redirect_to :action=> 'login'
	else
		@user = User.new(params[:user])
	
		respond_to do |format|
		  if @user.save
			format.html { redirect_to(@user, :notice => 'User was successfully created.') }
			format.xml  { render :xml => @user, :status => :created, :location => @user }
		  else
			format.html { render :action => "new" }
			format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
		  end
		end
	end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
  	if !session[:user_id]
		redirect_to :action=> 'login'
	else
		@user = User.find(params[:id])
	
		respond_to do |format|
		  if @user.update_attributes(params[:user])
			format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
			format.xml  { head :ok }
		  else
			format.html { render :action => "edit" }
			format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
		  end
		end
	end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    if !session[:user_id]
		redirect_to :action=> 'login'
	else
		@user = User.find(params[:id])
		@user.destroy
	
		respond_to do |format|
		  format.html { redirect_to(users_url) }
		  format.xml  { head :ok }
		end
	end
  end
  
  def login
  end
  
  def authenticate
	#User.new(params[:userform]) will create a new object of User, retrieve values from the form and store it variable @user.
	@user = User.new(params[:userform])
	#find records with username,password
	valid_user = User.find(:first,:conditions => ["first_name = ? and password = ?",@user.first_name, @user.password])

	#if statement checks whether valid_user exists or not
	if valid_user
	#creates a session with username
		session[:user_id]=valid_user.first_name
	#redirects the user to our private page.
		redirect_to :action => 'index'
	else
		flash[:notice] = "Invalid User/Password"
		redirect_to :action=> 'login'
	end
  end
end
