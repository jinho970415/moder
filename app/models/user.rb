class User < ActiveRecord::Base
  rolify
  
    has_secure_password
    has_many :contents
    validates :email, uniqueness: true #이메일 하나에 대해서 여러가지 옵션
    
    #validates_uniqueness_of :email #유효성 검사를 여러 개의 데이터에서 적용 가능
end
