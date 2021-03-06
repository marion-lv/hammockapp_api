describe 'CourseraQuery' do

  describe '#get_all_coursera_courses' do

    let(:courseraquery){ CourseraQuery.new }

    it 'returns a collection of 19 json responses' do
      expect(courseraquery.get_all_courses.length).to eq(19)
    end

    it 'returns json responses with the correct payload' do
      first_response = courseraquery.get_all_courses.first
      expect(first_response[0].has_key?("name")).to eq true
    end

  end

end
