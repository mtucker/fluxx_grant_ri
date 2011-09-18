class FluxxGrantAddViewModelDocumentToGranteeProfile < ActiveRecord::Migration
  def self.up
    grantee_profile = UserProfile.where(:name => 'Grantee').first
    UserProfileRule.create :user_profile => grantee_profile, :permission_name => 'view', :model_type => 'ModelDocument'
  end

  def self.down
    grantee_profile = UserProfile.where(:name => 'Grantee').first
    UserProfileRule.where(:user_profile_id => grantee_profile.object_id, :permission_name => 'view', :model_type => 'ModelDocument').first.destroy
  end
end