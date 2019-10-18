const GOOGLE_API_KEY = 'AIzaSyAOYx963AjQAAyuzaE8ue5QpbSyr2MbEBU';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red|label:A|$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}