class AlbumPresenter < SimpleDelegator
  def initialze(album)
    super(album)
  end

  def sharing_option
    return 'Privado' if exclusive?

    'Público'
  end
end
