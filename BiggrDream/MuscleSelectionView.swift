import SwiftUI

struct MuscleSelectionView: View {

    @Binding var selected: Set<MuscleGroup>

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {

            ForEach(MuscleGroup.allCases, id: \.self) { group in

                Button {
                    toggle(group)
                } label: {
                    VStack(spacing: 10) {

                        Image(systemName: group.icon)
                            .font(.system(size: 28))

                        Text(group.title)
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity, minHeight: 90)
                    .background(
                        selected.contains(group)
                        ? Color.blue.opacity(0.25)
                        : Color.gray.opacity(0.1)
                    )
                    .cornerRadius(12)
                }
                .foregroundColor(.primary)
            }
        }
        .padding()
    }

    private func toggle(_ group: MuscleGroup) {
        if selected.contains(group) {
            selected.remove(group)
        } else {
            selected.insert(group)
        }
    }
}
