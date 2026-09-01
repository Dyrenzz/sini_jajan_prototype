import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/umkm_model.dart';

class FirebaseService {
  final CollectionReference _umkmCollection = FirebaseFirestore.instance.collection('umkm');

  // Mengambil daftar UMKM secara realtime (Stream)
  Stream<List<UmkmModel>> getUMKMList() {
    return _umkmCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UmkmModel.fromFirestore(
            doc.data() as Map<String, dynamic>,
            doc.id
          );
      }).toList();
    }); 
  }

  // Menambahkan UMKM baru ke Firestore
  Future<void> addUmkm(UmkmModel umkm) async {
    await _umkmCollection.add(umkm.toFirestore());
  }
}