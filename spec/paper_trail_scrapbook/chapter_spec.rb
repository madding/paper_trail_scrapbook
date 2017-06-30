require 'spec_helper'

module PaperTrailScrapbook
  ::RSpec.describe Chapter do
    let(:version) do
      OpenStruct.new(id:             2_674_798,
                     item_type:      'Widget',
                     item_id:        4804,
                     event:          'update',
                     whodunnit:      '1742',
                     object:         ['---',
                                      'id: ',
                                      'discounted_amount: '].join("\n"),
                     created_at:     Time.current,
                     object_changes: ['---',
                                      'email:',
                                      '- ',
                                      '- tim@redbox.com',
                                      'name:',
                                      '- ',
                                      '- Tim Chambers',
                                      'sent:',
                                      '- false',
                                      '- true',
                                      'created_by:',
                                      '- ',
                                      '- 1742',
                                      'amount:',
                                      '- ',
                                      '- 29612.0',
                                      'discounted_amount:',
                                      '- ',
                                      '- !ruby/object:BigDecimal 36:0.29612E5',
                                      'created_at:',
                                      '- ',
                                      '- &1 2017-06-07 21:37:02.188657104 Z',
                                      'updated_at:',
                                      '- ',
                                      '- *1',
                                      'id:',
                                      '- ',
                                      '- 4806',
                                      'status:',
                                      '- active',
                                      '- issued'].join("\n"))
    end

    let(:object) { described_class.new(version) }
    let(:subject) { object.story }

    describe '#story' do
      it 'provides a whole story' do
        expect(subject).to match(/discounted_amount: 29612.0 added/)
      end
    end
  end
end
