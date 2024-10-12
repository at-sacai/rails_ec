namespace :coupon_code do
  desc 'Create Coupon'
  task generate: :environment do
    10.times do
      @coupon = Coupon.new
      @coupon.code = [*'a'..'z', *'A'..'Z', *0..9].sample(7).join
      @coupon.discount_price = rand(100..1000)
      @coupon.save!
    end
  end
end
