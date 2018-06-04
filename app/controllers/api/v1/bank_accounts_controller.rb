module Api
  module v1
    class BankAccountsController < ApplicationController
      def new_transaction
        amount            = params[:amount]
        transaction_type  = params[:transactionType]
        bank_account_id   = params[:bankAccoutId]
      end
    end
  end
end
