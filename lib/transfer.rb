class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
@@all = []
def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
  @@all << self
end

def valid?
  if self.receiver.valid? && self.sender.valid?
    true
  else
    false
  end
end

def execute_transaction
  if valid?
    if @sender.balance > @amount && @status == "pending"
      @sender.balance = @sender.balance - amount
      @receiver.balance = @receiver.balance + amount
      @status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end

def reverse_transfer
# tran = Transfer.all.find {|transfer| transfer.sender == sender && transfer.receiver == receiver}
  if self.status = "complete"
    self.receiver.balance = receiver.balance - self.amount
    self.sender.balance = sender.balance + self.amount
    self.status = "reversed"
  end
end














end
