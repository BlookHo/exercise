module Api::V1
  class GroupEventsController < ApplicationController
    before_action :set_group_event, only: [:show, :update, :remove, :publish]

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

    # GET /group_events/1
    def remove
      if @group_event.blank?
        render json: { deleted_event: [],
                       error: 'Blank record; check params',
                       code: 400,
                       status: :bad_request,
        }
      else
        @group_event.delete_event
        render json: { deleted_event: @group_event,
                       code: 200,
                       status: :success,
        }, except: [:created_at, :updated_at]
       end
    end

    # GET /group_events/1
    def publish
      if @group_event.blank?
        render json: { published_event: [],
                       error: 'Blank record; check params',
                       code: 400,
                       status: :bad_request,
        }
      else
        @group_event.publish_event
        render json: { published_event: @group_event,
                       code: 200,
                       status: :success,
        }, except: [:created_at, :updated_at]
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_group_event
        @group_event = GroupEvent.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def group_event_params
        params.permit(:user_id, :start, :duration, :name, :location, :description)
      end

  end
end
