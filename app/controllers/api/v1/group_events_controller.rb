module Api::V1
  class GroupEventsController < ApplicationController
    before_action :set_group_event, only: [:show, :update, :publish, :destroy]

    # GET /group_events
    def index
      @group_events = GroupEvent.all
      render json: { group_events: @group_events }, except: [:created_at, :updated_at]
    end

    # GET /group_events/1
    def show
      render json: @group_event
    end

    # POST /group_events
    def create
      @group_event = GroupEvent.new(group_event_params)
      if @group_event.save
        render json: @group_event.as_json, status: :created
      else
        render json: {user: @group_event.errors, status: :no_content}
      end
    end

    # PATCH/PUT /group_events/1
    def update
      if @group_event.update(group_event_params)
        render json: @group_event
      else
        render json: @group_event.errors, status: :unprocessable_entity
      end
    end

    # DELETE /group_events/1
    # DELETE /group_events/1.json
    def destroy
      if @group_event.deleted
        render json: { deleted_event: [],
                       deleted_already: not_modified,
        }
      else
        @group_event.delete_event
        render json: { deleted_event: @group_event,
                       code: 200,
                       status: :success,
        }, except: [:created_at, :updated_at]
      end
    end

    def not_modified
      { error: 'Action already done',
        code: 304,
        status: :not_modified
      }
    end

    # PUT /group_events/1
    def publish
      if @group_event.published
        render json: { published_event: [],
                       published_already: not_modified,
        }
      else
        @group_event.publish_event
        response_publish
      end
    end

    def response_publish
      if @group_event.errors.size > 0
        render json: { published_event: [],
                       published_forbidden: @group_event.errors
        }, except: [:created_at, :updated_at]
      else
        render json: { published_event: @group_event,
                       code: 200,
                       status: :success,
        }, except: [:created_at, :updated_at]
      end
    end

    private
      def set_group_event
        @group_event = GroupEvent.find(params[:id])
      end

      def group_event_params
        params.permit(:user_id, :start, :duration, :name, :location, :description)
      end

  end
end
