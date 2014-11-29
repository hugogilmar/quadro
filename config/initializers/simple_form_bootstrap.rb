# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, :tag => 'div', :class => 'form-group', :error_class => 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input
    b.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
    b.use :error, :wrap_with => { :tag => 'span', :class => 'help-block has-error' }
  end

  config.wrappers :prepend, :tag => 'div', :class => "form-group", :error_class => 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper :tag => 'div', :class => 'input-group' do |prepend|
      prepend.use :input
    end
    b.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
    b.use :error, :wrap_with => { :tag => 'span', :class => 'help-block has-error' }
  end

  config.wrappers :append, :tag => 'div', :class => "form-group", :error_class => 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper :tag => 'div', :class => 'input-group' do |prepend|
      prepend.use :input
    end
    b.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
    b.use :error, :wrap_with => { :tag => 'span', :class => 'help-block has-error' }
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
