class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :reciever, :amount
@@all = []
def initialize(sender, reciever, amount)
  @sender = sender
  @reciever = reciever
  @status = "pending"
  @amount = amount
end

def valid?
  if self.reciever.valid? && self.sender.valid?
    true
  else
    false
  end
end

def execute_transaction
  if self.valid?
    if sender.balance > amount && self.status == "pending"
      sender.balance - amount
      reciever.balance + amount
      self.status = "complete"
    else
      "Transaction rejected. Please check your account balance."
      self.status = "rejected"
    end
  end
end













  
end

