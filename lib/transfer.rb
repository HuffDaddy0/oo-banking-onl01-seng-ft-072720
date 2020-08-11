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
  @@all << self
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
      sender.balance = sender.balance - amount
      reciever.balance = reciever.balance + amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end

def reverse_transfer(sender, reciever)
# tran = Transfer.all.find {|transfer| transfer.sender == sender && transfer.reciever == reciever}
  if self.status = "complete"
    reciever.balance = reciever.balance - self.amount
    sender.balance = sender.balance + self.amount
    self.status = "reversed"
  end
end
end














end
