module Entities
  class Contact < Base
    self.model = ::Contact

    expose :name
    expose :address,
      using: Entities::Address

    def name
      "#{object.firstname} #{object.lastname}"
    end

    after_params_assignment do |params, instance|
      if params[:name]
        names = params[:name].split(' ')
        instance.lastname, instance.firstname = names.pop, names.join
      end
    end
  end
end
