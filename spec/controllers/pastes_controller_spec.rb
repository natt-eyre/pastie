require "rails_helper"

describe PastesController do
  describe "#create" do
    context "signed in with valid paste" do
      it "creates a paste" do
        paste = stub_paste(save: true)

        sign_in
        post_create

        expect(paste).to have_received(:save)
        expect(controller).to redirect_to(paste)
      end
    end

    context "signed in with invalid paste" do
      it "re-renders the form" do
        stub_paste(save: false)

        sign_in
        post_create

        expect(controller).to render_template(:new)
      end
    end

    context "signed out with valid paste" do
      it "redirects to sign in form" do
        stub_paste

        sign_out
        post_create

        expect(controller).to redirect_to(sign_in_path)
      end
    end

    def stub_paste(save: true)
      build_stubbed(:paste).tap do |paste|
        allow(paste).to receive(:save).and_return(save)
        allow(Paste).to receive(:new).with(paste_params).and_return(paste)
      end
    end

    def post_create
      post :create, paste: paste_params
    end

  end

  let(:paste_params) { attributes_for(:paste) }
end