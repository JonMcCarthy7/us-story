require "rails_helper"

RSpec.describe RemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rems").to route_to("rems#index")
    end

    it "routes to #new" do
      expect(get: "/rems/new").to route_to("rems#new")
    end

    it "routes to #show" do
      expect(get: "/rems/1").to route_to("rems#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/rems/1/edit").to route_to("rems#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/rems").to route_to("rems#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/rems/1").to route_to("rems#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rems/1").to route_to("rems#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rems/1").to route_to("rems#destroy", id: "1")
    end
  end
end
