require 'rails_helper'

describe Courseitem, type: :model do

  describe '#check_cloned_status' do

    let(:user) {FactoryGirl.create :user}
    let(:courseitem){ FactoryGirl.create :courseitem}

    it 'returns the status of the clone if the current user has a course cloned from the courseitem' do
      course = Course.build_with_clone(courseitem, user)
      course.save
      expect(courseitem.check_cloned_status(user)).to eq "interested"
    end

    it 'returns false if the current user does not have a course cloned from the courseitem' do
      course = FactoryGirl.build :course
      course.user_id = user.id
      course.save
      expect(courseitem.check_cloned_status(user)).to eq false
    end

    context 'course is in progress' do

      it 'returns the status as in progress' do
        course = Course.build_with_clone(courseitem, user, "in progress")
        course.save
        expect(courseitem.check_cloned_status(user)).to eq "in progress"
      end

    end


  end

  describe '#clone_id' do

    let(:user) {FactoryGirl.create :user}
    let(:courseitem){ FactoryGirl.create :courseitem}

    it 'returns the id of the users clone if the courseitem has been cloned' do
      course = Course.build_with_clone(courseitem, user)
      course.save
      expect(courseitem.clone_id(user)).to eq course.id
    end

    it 'returns nil if the courseitem has not been cloned' do
      expect(courseitem.clone_id(user)).to eq nil
    end

  end



end
