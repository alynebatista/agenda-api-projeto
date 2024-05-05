class ContatosController < ApplicationController
    def create
        @contato = Contato.new(contato_params)
        
        if @contato.save
          render json: @contato, status: :created
        else
          render json: @contato.errors, status: :unprocessable_entity
        end
      end
  
      def show
          @contato = Contato.find(params[:id])
          render json: @contato
      end
      
      def index
          @contatos = Contato.all
          render json: @contatos
      end
  
      def update
          @contato = Contato.find(params[:id])
          if @contato.update(contato_params)
              render json: @contato
          else
              render json: @contato.errors, status: :unprocessable_entity
          end
      end
  
      def destroy
          @contato = Contato.find(params[:id])
          @contato.destroy!
      end
  
      private
  
      def contato_params
        params.require(:contato).permit(:nome, :telefone, :email)
      end
end
