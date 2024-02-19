class MunicipeObserver < ActiveRecord::Observer
  observe :municipe

  def after_create(municipe)
    NotifyMunicipeService.new(municipe).send_notifications('create')
  end

  def after_update(municipe)
    NotifyMunicipeService.new(municipe).send_notifications('update')
  end
end
