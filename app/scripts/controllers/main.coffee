'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the testFrontEndApp
###

app = angular.module 'testFrontEndApp'
app.controller 'MainCtrl', ($scope, $location, $window, serviceAjax) ->

    $scope.username = $window.sessionStorage.getItem 'name'
    $scope.email = $window.sessionStorage.getItem 'email'
    $scope.isLogged = $window.sessionStorage.getItem 'isLogin'
    console.log 'main', $scope.username, $window.sessionStorage.getItem 'isLogin', $scope.isLogged
    
    $scope.tops = []
    
    $scope.$on "userLogged", (event, args) ->
       console.log 'userLogged'
       $scope.username = args.username
       $scope.email = args.email
       $scope.isLogged = args.isLoggin
       
    
    $scope.statUsers = () ->
        stat = new Array
        console.log 'statUser', $scope.tops
        ddata = [
          {
            'label': 'one'
            'value': 20
          }
          {
            'label': 'two'
            'value': 50
          }
          {
            'label': 'three'
            'value': 30
          }
        ]
        console.log 'fake:',ddata
        for top in $scope.tops
            console.log top.user.name
            stat.push {'label': top.user.name, 'value':50}
        console.log stat    
        stat
            
    
    serviceAjax.getAllTop().success (data, status) ->
        $scope.tops = data || []
        $scope.i = 1
        if $scope.tops.length > 0 
          $scope.noTop = false
        else
          $scope.noTop = true
          
        #$scope.statUsers()  
        
        vis = d3.select('#user_char').append('svg:svg').data([ $scope.statUsers() ]).attr('width', w).attr('height', h).append('svg:g').attr('transform', 'translate(' + r + ',' + r + ')')
        #move the center of the pie chart from 0, 0 to radius, radius
        arc = d3.svg.arc().outerRadius(r)
        pie = d3.layout.pie().value((d) ->
          d.value
        )
        #we must tell it out to access the value of each element in our data array
        arcs = vis.selectAll('g.slice').data(pie).enter().append('svg:g').attr('class', 'slice')
        #allow us to style things in the slices (like text)
        arcs.append('svg:path').attr('fill', (d, i) ->
          color i
        ).attr 'd', arc
        #this creates the actual SVG path using the associated data (pie) with the arc drawing function
        arcs.append('svg:text').attr('transform', (d) ->
          #set the label's origin to the center of the arc
          #we have to make sure to set these before calling arc.centroid
          d.innerRadius = 0
          d.outerRadius = r
          'translate(' + arc.centroid(d) + ')'
          #this gives us a pair of coordinates like [50, 50]
        ).attr('text-anchor', 'middle').text (d, i) ->
          data[i].label
    
        return
      .error (status) ->
        console.log status
        $scope.noTop = true

        return
        
        
    w = 200
    h = 200
    r = 100
    color = d3.scale.category20c()
    #builtin range of colors
    data = [
      {
        'label': 'one'
        'value': 20
      }
      {
        'label': 'two'
        'value': 50
      }
      {
        'label': 'three'
        'value': 30
      }
    ]
   
    vis2 = d3.select('#tops_char').append('svg:svg').data([ data ]).attr('width', w).attr('height', h).append('svg:g').attr('transform', 'translate(' + r + ',' + r + ')')
    #move the center of the pie chart from 0, 0 to radius, radius
    arc = d3.svg.arc().outerRadius(r)
    pie = d3.layout.pie().value((d) ->
      d.value
    )
    #we must tell it out to access the value of each element in our data array
    arcs = vis2.selectAll('g.slice').data(pie).enter().append('svg:g').attr('class', 'slice')
    #allow us to style things in the slices (like text)
    arcs.append('svg:path').attr('fill', (d, i) ->
      color i
    ).attr 'd', arc
    #this creates the actual SVG path using the associated data (pie) with the arc drawing function
    arcs.append('svg:text').attr('transform', (d) ->
      #set the label's origin to the center of the arc
      #we have to make sure to set these before calling arc.centroid
      d.innerRadius = 0
      d.outerRadius = r
      'translate(' + arc.centroid(d) + ')'
      #this gives us a pair of coordinates like [50, 50]
    ).attr('text-anchor', 'middle').text (d, i) ->
      data[i].label
    
    vis3 = d3.select('#worldclass_char').append('svg:svg').data([ data ]).attr('width', w).attr('height', h).append('svg:g').attr('transform', 'translate(' + r + ',' + r + ')')
    #move the center of the pie chart from 0, 0 to radius, radius
    arc = d3.svg.arc().outerRadius(r)
    pie = d3.layout.pie().value((d) ->
      d.value
    )
    #we must tell it out to access the value of each element in our data array
    arcs = vis3.selectAll('g.slice').data(pie).enter().append('svg:g').attr('class', 'slice')
    #allow us to style things in the slices (like text)
    arcs.append('svg:path').attr('fill', (d, i) ->
      color i
    ).attr 'd', arc
    #this creates the actual SVG path using the associated data (pie) with the arc drawing function
    arcs.append('svg:text').attr('transform', (d) ->
      #set the label's origin to the center of the arc
      #we have to make sure to set these before calling arc.centroid
      d.innerRadius = 0
      d.outerRadius = r
      'translate(' + arc.centroid(d) + ')'
      #this gives us a pair of coordinates like [50, 50]
    ).attr('text-anchor', 'middle').text (d, i) ->
      data[i].label
    #get the label from our original data array
