require "rails_helper"

describe PastesController do
  describe "#create" do
    context "signed in with valid paste" do
      it "creates a paste" do
        paste_params = attributes_for(:paste)
        paste = build_stubbed(:paste)
        allow(Paste).to receive(:new).with(paste_params).and_return(paste)
        allow(paste).to receive(:save).and_return(true)

        sign_in
        post :create, paste: paste_params

        expect(paste).to have_received(:save)
        expect(controller).to redirect_to(paste)
      end
    end

    context "signed in with invalid paste" do
      it "re-renders the form" do
        paste_params = attributes_for(:paste)
        paste = build_stubbed(:paste)
        allow(Paste).to receive(:new).and_return(paste)
        allow(paste).to receive(:save).and_return(false)

        sign_in
        post :create, paste: paste_params

        expect(controller).to render_template(:new)
      end
    end

  end
end