# frozen_string_literal: true

module ShiftCopy
  class CopyAdvanced < CopyBase
    private

    def gap_time
      @gap_time ||= (@shift_copy_job.target_date.to_i - @shift_copy_job.start_date.to_i).second
    end

    def shifts_to_copy
      return @shifts_to_copy if defined?(@shifts_to_copy)

      @shifts_to_copy = @shift_copy_job
                          .organisation
                          .rostered_shifts
                          .with_hr

      if advanced_rostering_write? && use_css_worksites?
        @shifts_to_copy = @shifts_to_copy.where(hr_position_id: accessible_hr_positions.pluck(:id))
      end

      @shifts_to_copy = @shifts_to_copy.in_range_time(
        @shift_copy_job.start_date,
        @shift_copy_job.end_date
      )

      unless @shift_copy_job.all_employees?
        @shifts_to_copy = @shifts_to_copy.where(member_id: @shift_copy_job.member_ids)
      end

      @shifts_to_copy
    end

    def use_css_worksites?
      @use_css_worksites ||= RosteringManagementPolicy.new(auth_context).use_css_worksites?
    end

    def accessible_hr_positions
      return @accessible_hr_positions if defined?(@accessible_hr_positions)

      @accessible_hr_positions = @shift_copy_job.organisation.hr_positions.active.where(work_site_id: accessible_work_site_ids)
    end

    def accessible_work_site_ids
      return @accessible_work_site_ids if defined?(@accessible_work_site_ids)

      @accessible_work_site_ids = WorkSitePolicy::Scope.new(auth_context,
                                                            @shift_copy_job.organisation.work_sites).resolve.pluck(:id)
    end
  end
end
