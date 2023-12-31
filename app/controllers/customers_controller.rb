class CustomersController < ApplicationController
    def index
        # nothing
    end

    def show
      id = params[:id]
      @customer = Customer.find(id)
    end
    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            flash[:notice] = "Customer with id: #{@customer.id} was successfully created"
        else
            flash[:notice] = "Create Customer Failed"
        end
        redirect_to '/customers'
    end
    def edit
      id = params[:id]
      @customer = Customer.find(id)
    end
    def getAddresses
      id = params["value"]
      @customer = Customer.find(id)
      @addresses = @customer.addresses.select(Address.attribute_names - ['customer_id'])
      render json: @addresses
    end
    def getPayments
      id = params["value"]
      @customer = Customer.find(id)
      @payments = @customer.payments.select(Payment.attribute_names - ['customer_id'])
      render json: @payments
    end
    def getOrders
      id = params["value"]
      @customer = Customer.find(id)
      @orders = @customer.orders.select(Order.attribute_names - ['customer_id'])
      render json: @orders
    end
    def update
      @customer = Customer.find (params[:id])
      @customer.update(customer_params)
      flash[:notice] = " Customer details with id #{@customer.id} successfully updated."
      redirect_to '/customers'
    end
    def display
        list = customer_params
        if list.empty?
            @customers = Customer.all
        else
            @customers = Customer.where(list)
        end
        render json: @customers
    end
  def new
  end
  def destroy
      @customer = Customer.find(params[:id])
      @customer.destroy
      @message = {:message =>"Customer successfully deleted"}
      
      render json: @message
    end
  private

  def customer_params
    params.require(:customer).permit(:name, :email, :contact).
    delete_if {|key, value| value.blank? }
  end
end
