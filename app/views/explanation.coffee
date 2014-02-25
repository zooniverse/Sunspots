module.exports = App.ExplanationView = Ember.View.extend
  templateName: 'explanation'
  
  examples: (->
    example0 =
      left:
        image: 'images/examples/0_left.jpg'
      right:
        image: 'images/examples/0_right.jpg'
        complex: true
    
    example1 =
      left:
        image: 'images/examples/1_left.jpg'
        complex: true
      right:
        image: 'images/examples/1_right.jpg'
    
    example2 =
      left:
        image: 'images/examples/2_left.jpg'
      right:
        image: 'images/examples/2_right.jpg'
        complex: true
    
    [example0, example1, example2]
  ).property('')
