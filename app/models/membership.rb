class Membership < ApplicationRecord
    validates :gym_id, uniqueness: true
    validate :one_membership_per_client
    validates :charge, presence: true

    belongs_to :gym
    belongs_to :client


    def one_membership_per_client
        # byebug
        memberships = self.client.memberships
        # unique_membership = memberships.map(&:gym_id).uniq
        unique_membership = memberships.map do |membership| 
            membership.gym_id
        end
        # unique_membership.to_i
        
        if unique_membership == gym_id
            render json: { error: "Gym not found" }, status: :not_found
        end
        # client = Client.find(client_id)
        # client.gyms
    end
end
