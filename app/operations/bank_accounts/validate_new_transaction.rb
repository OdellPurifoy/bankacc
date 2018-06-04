module BankAccounts
  class ValidateNewTransaction
    def initialize(amount:, transaction_type:, bank_account_id:)
      @amount           = amount
      @transaction_type = transaction_type
      @bank_account_id  = bank_account_id
      @bank_account     = BankAccount.where(id: @bank_account_id).first
      @errors           = []
    end

    def execute!
      validates_existance_of_account!

      if @transaction_type == "withdraw" and @bank_account.present?
        validate_withdrawl!
      end
      @errors
    end

    private

    def validate_withdrawl!
      if @bank_account.balance - @amount < 0.00
        @errors << "Insufficient funds."
      end
    end

    def validates_existance_of_account!
      if @bank_account.blank?
        @errors << "Account not found."
      end
  end
end
end
