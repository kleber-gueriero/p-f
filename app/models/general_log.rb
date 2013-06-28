class GeneralLog < ActiveRecord::Base
  attr_accessible :body, :header, :log_type
end
