import 'dart:math' as Math;

class Point  {

  num x = 0;
  num y = 0;

  Point([this.x=0, this.y=0]);

  Point add(Point p) {
    return Point(this.x + p.x, this.y + p.y);
  }

  Point clone() {
    return Point(this.x, this.y);
  }

  num degreesTo(Point p) {
    num dx = this.x = p.x; 
    num dy = this.y = p.y;
    num angle = Math.atan2(dy, dx); // radians
    return angle * (180 / Math.pi); // degrees
  }

  num _distance(Point p) {
    num x = this.x - p.x;
    num y = this.y - p.y;
    return Math.sqrt(x * x + y * y);
  }

  bool equals(Point p) {
    return this.x == p.x && this.y == p.y;
  }

  /// find point between points
  Point _interpolate(Point p, num f) {
    return Point( p.x + (this.x - p.x) * f, p.y + (this.y - p.y) * f );
  }

  num length() {
    return Math.sqrt(this.x * this.x + this.y * this.y);
  }

  void normalize(num thickness) {
    num l = this.length();
    this.x = this.x / l * thickness;
    this.y = this.y / l * thickness;
  }

  void orbit(Point origin, num arcWidth, num arcHeight, num degrees) {
    num radians = degrees * (Math.pi / 180);
    this.x = origin.x + arcWidth * Math.cos(radians);
    this.y = origin.y + arcHeight * Math.sin(radians);
  }

  void offset(num dx, num dy) {
    this.x += dx;
    this.y += dy;
  }

  Point subtract(Point p) {
    return Point(this.x - p.x, this.y - p.y);
  }

  @override
  String toString() {
    return '(x=${this.x}, y=${this.y})';
  }

  static Point pointsInterpolation(Point p1, Point p2, num f) {
	  return p1._interpolate(p2, f);
  }
  static Point polar(num l, num r) {
    return Point(l * Math.cos(r), l * Math.sin(r));
  }
  static num distance(Point p1, Point p2) {
    return p1._distance(p2);
  }

  Point operator +(Point p) => Point(this.x+p.x, this.y+p.y);

  bool operator ==(Object p) => this.hashCode == p.hashCode;
  
  @override
  int get hashCode => this.x.hashCode + this.y.hashCode;

}