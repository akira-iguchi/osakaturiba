# require 'rails_helper'

# RSpec.describe UsersController, type: :controller do
#   shared_examples '誰でもアクセスできること' do
#     before :each do
#       @user = User.new(
#         name: 'akira', 
#         email: 'akira@akira.com', 
#         password: 'akira'
#       )
#     end
    
#     describe 'GET #show' do 
#       it "@userに要求された連絡先を割り当てること" do
#         get :show, params: {id: @user.id}
#         expect(assigns(:user)).to eq @user
#       end
      
#       it ":showテンプレートを表示すること" do
#         get :show, params: {id: @user.id}
#         expect(response).to render_template :show
#       end
      
#     end
    
#     describe 'GET #likes' do
#       it "@userに要求された連絡先を割り当てること"
#       it ":showテンプレートを表示すること"
#     end
#   end
  
#   shared_examples '全てにアクセスできること' do
#     describe 'GET #new' do 
#       it "@userに新しい連絡先を割り当てること" do
#         get :new
#         expect(assigns(:user)).to be_a_new(User)
#       end
      
#       it ":newテンプレートを表示すること" do
#         get :new
#         expect(response).to render_template :new
#       end
#     end
    
#     describe 'POST #create' do
#       before do
#         @user = [attributes_for(:user)]
#       end
      
#       context "有効な属性の場合" do
#         it "データベースに新しい連絡先を保存すること" do
#           expect{
#             post :create, 
#             user: attributes_for(:user, user_attributes: @user)
#           }.to change(User, :count).by(1)
#         end
        
#         it "users#showにリダイレクトすること" do
#           post :create, user: attributes_for(:user, user_attributes: @user)
#           expect(response).to redirect_to user_path(assigns[:user])
#         end
#       end 
      
#       context "無効な属性の場合" do
#         it "データベースに新しい連絡先を保存しないこと" do
#           expect{
#             post :create, 
#             user: attributes_for(:invalid_user)
#           }.not_to change(User, :count)
#         end
        
#         it ":newテンプレートを再表示すること" do
#           post :create, user: attributes_for(:invalid_user)
#           expect(response).to render_template :new
#         end
#       end 
#     end
    
#     describe 'GET #edit' do 
#       it "@userに要求された連絡先を割り当てること" do
#         user = create(:user)
#         get :edit, params: { id: user.id }
#         expect(assigns(:user)).to eq user
#       end
      
#       it ":editテンプレートを表示すること" do
#         user = create(:user)
#         get :edit, params: { id: user.id }
#         expect(response).to render_template :edit
#       end
#     end
    
#     describe 'PATCH #update' do
#       before do
#         @user = User.new(name: 'turitaro', email: 'sakana@umi.com')
#       end
      
#       context "有効な属性の場合" do
#         it "要求された@userを取得すること" do
#           patch :update, id: @user, user: attributes_for(:user)
#           expect(assigns(:user)).to eq(@user)
#         end
      
#         it "@userの属性を変更すること" do
#           patch :update, id: @user, 
#             user: attributes_for(:user, name: 'turiziro', email: 'umi@turi.com')
#           @user.reload
#           expect(@user.name).to eq('turiziro')
#           expect(@user.email).to eq('umi@turi.com')
#         end
        
#         it "更新した連絡先のページへリダイレクトすること" do
#           patch :update, id: @user, user: attributes_for(:user)
#           expect(response).to redirect_to @user
#         end
#       end
      
#       context "無効な属性の場合" do
#         it "連絡先の属性を変更しないこと" do
#           patch :update, id: @user, 
#             user: attributes_for(:user, name: 'turiziro', email: nil)
#           @user.reload
#           expect(@user.name).not_to eq('turiziro')
#           expect(@user.email).not_to eq('umi@turi.com')
#         end
        
#         it ":editテンプレートを再表示すること" do
#           patch :update, id: @user, user: attributes_for(:invalid_user)
#           expect(response).to render_template :edit
#         end
#       end 
#     end
#   end
  
#   describe 'ユーザーのアクセス' do
#     it_behaves_like "誰でもアクセスできること"
#     it_behaves_like "全てにアクセスできること"
#   end
  
#   describe "logout_user access" do
#     it_behaves_like "誰でもアクセスできること"
    
#     describe 'GET #edit' do 
#       it "ログインを要求すること" do
#         user = create(:user)
#         get :edit, params: { id: user.id }
#         expect(response).to redirect_to login_url
#       end
#     end
    
#     describe 'PATCH #update' do
#       it "ログインを要求すること" do
#         put :update, id: create(:user)
#         expect(response).to redirect_to login_url
#       end
#     end
#   end
# end
